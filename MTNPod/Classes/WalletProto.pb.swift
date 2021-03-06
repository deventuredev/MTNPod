// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: WalletProto.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct WalletModelProto {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: Int64 = 0

  var mapTokenID: Int64 = 0

  var name: String = String()

  var imageURL: String = String()

  var expirationDate: String = String()

  var campaignName: String = String()

  var rewardType: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension WalletModelProto: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "WalletModelProto"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "mapTokenId"),
    3: .same(proto: "name"),
    4: .same(proto: "imageUrl"),
    5: .same(proto: "expirationDate"),
    6: .same(proto: "campaignName"),
    7: .same(proto: "rewardType"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt64Field(value: &self.id) }()
      case 2: try { try decoder.decodeSingularInt64Field(value: &self.mapTokenID) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.imageURL) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.expirationDate) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.campaignName) }()
      case 7: try { try decoder.decodeSingularInt32Field(value: &self.rewardType) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularInt64Field(value: self.id, fieldNumber: 1)
    }
    if self.mapTokenID != 0 {
      try visitor.visitSingularInt64Field(value: self.mapTokenID, fieldNumber: 2)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 3)
    }
    if !self.imageURL.isEmpty {
      try visitor.visitSingularStringField(value: self.imageURL, fieldNumber: 4)
    }
    if !self.expirationDate.isEmpty {
      try visitor.visitSingularStringField(value: self.expirationDate, fieldNumber: 5)
    }
    if !self.campaignName.isEmpty {
      try visitor.visitSingularStringField(value: self.campaignName, fieldNumber: 6)
    }
    if self.rewardType != 0 {
      try visitor.visitSingularInt32Field(value: self.rewardType, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: WalletModelProto, rhs: WalletModelProto) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.mapTokenID != rhs.mapTokenID {return false}
    if lhs.name != rhs.name {return false}
    if lhs.imageURL != rhs.imageURL {return false}
    if lhs.expirationDate != rhs.expirationDate {return false}
    if lhs.campaignName != rhs.campaignName {return false}
    if lhs.rewardType != rhs.rewardType {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
