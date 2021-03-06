/***************************************************************************
 *
 * Copyright (c) 2013 Baidu, Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 **************************************************************************/
// Author: Wen Xiang <bigflow-opensource@baidu.com>

#include "flume/core/loader.h"

#include <string>

#include "flume/proto/split.pb.h"  // flume/proto/split.proto

namespace baidu {
namespace flume {
namespace core {

PbSplit Loader::EncodeSplit(const std::string& raw_split) {
    PbSplit message;
    message.set_magic(PbSplit::FLUME);
    message.set_raw_split(raw_split);
    return message;
}

PbSplit Loader::DecodeSplit(const std::string& split) {
    PbSplit message;
    if (!message.ParseFromString(split)) {
        message.Clear();
        message.set_magic(PbSplit::FLUME);
        message.set_raw_split(split);
    }
    return message;
}

}  // namespace core
}  // namespace flume
}  // namespace baidu
