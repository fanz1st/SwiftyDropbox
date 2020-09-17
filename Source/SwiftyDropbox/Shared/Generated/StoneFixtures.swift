///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

import Foundation

/// Datatypes and serializers for the stone_fixtures namespace
open class StoneFixtures {
    /// This struct left intentionally empty
    open class EmptyContainer: CustomStringConvertible {
        public init() {
        }
        open var description: String {
            return "\(SerializeUtil.prepareJSONForSerialization(EmptyContainerSerializer().serialize(self)))"
        }
    }
    open class EmptyContainerSerializer: JSONSerializer {
        public init() { }
        open func serialize(_ value: EmptyContainer) -> JSON {
            let output = [String: JSON]()
            return .dictionary(output)
        }
        open func deserialize(_ json: JSON) -> EmptyContainer {
            switch json {
                case .dictionary(_):
                    return EmptyContainer()
                default:
                    fatalError("Type error deserializing")
            }
        }
    }

    /// The MixedInternalOnlyContainer struct
    open class MixedInternalOnlyContainer: CustomStringConvertible {
        /// (no description)
        public let publicValue: Int32
        public init(publicValue: Int32 = 0) {
            comparableValidator()(publicValue)
            self.publicValue = publicValue
        }
        open var description: String {
            return "\(SerializeUtil.prepareJSONForSerialization(MixedInternalOnlyContainerSerializer().serialize(self)))"
        }
    }
    open class MixedInternalOnlyContainerSerializer: JSONSerializer {
        public init() { }
        open func serialize(_ value: MixedInternalOnlyContainer) -> JSON {
            let output = [ 
            "public_value": Serialization._Int32Serializer.serialize(value.publicValue),
            ]
            return .dictionary(output)
        }
        open func deserialize(_ json: JSON) -> MixedInternalOnlyContainer {
            switch json {
                case .dictionary(let dict):
                    let publicValue = Serialization._Int32Serializer.deserialize(dict["public_value"] ?? .number(0))
                    return MixedInternalOnlyContainer(publicValue: publicValue)
                default:
                    fatalError("Type error deserializing")
            }
        }
    }

    /// The MixedInternalOnlyEnum union
    public enum MixedInternalOnlyEnum: CustomStringConvertible {
        /// An unspecified error.
        case public_
        /// An unspecified error.
        case other

        public var description: String {
            return "\(SerializeUtil.prepareJSONForSerialization(MixedInternalOnlyEnumSerializer().serialize(self)))"
        }
    }
    open class MixedInternalOnlyEnumSerializer: JSONSerializer {
        public init() { }
        open func serialize(_ value: MixedInternalOnlyEnum) -> JSON {
            switch value {
                case .public_:
                    var d = [String: JSON]()
                    d[".tag"] = .str("public")
                    return .dictionary(d)
                case .other:
                    var d = [String: JSON]()
                    d[".tag"] = .str("other")
                    return .dictionary(d)
            }
        }
        open func deserialize(_ json: JSON) -> MixedInternalOnlyEnum {
            switch json {
                case .dictionary(let d):
                    let tag = Serialization.getTag(d)
                    switch tag {
                        case "public":
                            return MixedInternalOnlyEnum.public_
                        case "other":
                            return MixedInternalOnlyEnum.other
                        default:
                            return MixedInternalOnlyEnum.other
                    }
                default:
                    fatalError("Failed to deserialize")
            }
        }
    }

}