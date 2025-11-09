#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\DEVPROPKEY.ahk

/**
 * @namespace Windows.Win32.Devices.Properties
 * @version v4.0.30319
 */
class Properties {

;@region Constants

    /**
     * @type {Integer (Byte)}
     */
    static DEVPROP_TRUE => 0xFF

    /**
     * @type {Integer (Byte)}
     */
    static DEVPROP_FALSE => 0x00

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceInterface_Autoplay_Silent {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{434dd28f-9e75-450a-9ab9-ff61e618bad0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_NAME {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DeviceDesc {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_HardwareIds {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_CompatibleIds {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Service {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Class {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_ClassGuid {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Driver {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_ConfigFlags {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Manufacturer {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_FriendlyName {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_LocationInfo {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_PDOName {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Capabilities {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_UINumber {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_UpperFilters {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_LowerFilters {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_BusTypeGuid {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_LegacyBusType {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_BusNumber {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_EnumeratorName {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Security {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_SecuritySDS {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DevType {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 27
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Exclusive {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Characteristics {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 29
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Address {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 30
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_UINumberDescFormat {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 31
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_PowerData {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 32
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_RemovalPolicy {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 33
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_RemovalPolicyDefault {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 34
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_RemovalPolicyOverride {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 35
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_InstallState {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 36
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_LocationPaths {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_BaseContainerId {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 38
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_InstanceId {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 256
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DevNodeStatus {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_ProblemCode {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_EjectionRelations {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_RemovalRelations {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_PowerRelations {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_BusRelations {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Parent {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Children {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Siblings {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_TransportRelations {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_ProblemStatus {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Reported {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{80497100-8c73-48b9-aad9-ce387e19c56e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Legacy {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{80497100-8c73-48b9-aad9-ce387e19c56e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_ContainerId {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{8c7ed206-3f8a-4827-b3ab-ae9e1faefc6c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_InLocalMachineContainer {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{8c7ed206-3f8a-4827-b3ab-ae9e1faefc6c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Model {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 39
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_ModelId {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_FriendlyNameAttributes {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_ManufacturerAttributes {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_PresenceNotForDevice {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_SignalStrength {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_IsAssociateableByUserAction {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_ShowInUninstallUI {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_CompanionApps {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{6a742654-d0b2-4420-a523-e068352ac1df}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_PrimaryCompanionApp {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{6a742654-d0b2-4420-a523-e068352ac1df}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Numa_Proximity_Domain {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DHP_Rebalance_Policy {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Numa_Node {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_BusReportedDeviceDesc {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_IsPresent {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_HasProblem {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_ConfigurationId {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_ReportedDeviceIdsHash {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_PhysicalDeviceLocation {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_BiosDeviceName {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DriverProblemDesc {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DebuggerSafe {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_PostInstallInProgress {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_Stack {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_ExtendedConfigurationIds {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_IsRebootRequired {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_FirmwareDate {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_FirmwareVersion {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_FirmwareRevision {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DependencyProviders {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DependencyDependents {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_SoftRestartSupported {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_ExtendedAddress {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_AssignedToGuest {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_CreatorProcessId {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_FirmwareVendor {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_SessionId {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{83da6326-97a6-4088-9453-a1923f573b29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_InstallDate {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{83da6326-97a6-4088-9453-a1923f573b29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_FirstInstallDate {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{83da6326-97a6-4088-9453-a1923f573b29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 101
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_LastArrivalDate {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{83da6326-97a6-4088-9453-a1923f573b29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 102
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_LastRemovalDate {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{83da6326-97a6-4088-9453-a1923f573b29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 103
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DriverDate {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DriverVersion {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DriverDesc {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DriverInfPath {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DriverInfSection {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DriverInfSectionExt {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_MatchingDeviceId {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DriverProvider {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DriverPropPageProvider {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DriverCoInstallers {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_ResourcePickerTags {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_ResourcePickerExceptions {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DriverRank {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DriverLogoLevel {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_NoConnectSound {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_GenericDriverInstalled {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_AdditionalSoftwareRequested {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_SafeRemovalRequired {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{afd97640-86a3-4210-b67c-289c41aabe55}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_SafeRemovalRequiredOverride {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{afd97640-86a3-4210-b67c-289c41aabe55}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DrvPkg_Model {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DrvPkg_VendorWebSite {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DrvPkg_DetailedDescription {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DrvPkg_DocumentationLink {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DrvPkg_Icon {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DrvPkg_BrandingIcon {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_UpperFilters {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_LowerFilters {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_Security {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_SecuritySDS {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_DevType {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 27
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_Exclusive {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_Characteristics {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 29
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_Name {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_ClassName {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_Icon {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_ClassInstaller {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_PropPageProvider {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_NoInstallClass {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_NoDisplayClass {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_SilentInstall {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_NoUseClass {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_DefaultService {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_IconPath {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_DHPRebalanceOptOut {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{d14d3ef3-66cf-4ba2-9d38-0ddb37ab4701}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceClass_ClassCoInstallers {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{713d1703-a2e2-49f5-9214-56472ef3da5c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceInterface_FriendlyName {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{026e516e-b814-414b-83cd-856d6fef4822}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceInterface_Enabled {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{026e516e-b814-414b-83cd-856d6fef4822}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceInterface_ClassGuid {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{026e516e-b814-414b-83cd-856d6fef4822}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceInterface_ReferenceString {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{026e516e-b814-414b-83cd-856d6fef4822}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceInterface_Restricted {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{026e516e-b814-414b-83cd-856d6fef4822}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceInterface_UnrestrictedAppCapabilities {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{026e516e-b814-414b-83cd-856d6fef4822}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceInterface_SchematicName {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{026e516e-b814-414b-83cd-856d6fef4822}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceInterfaceClass_DefaultInterface {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{14c83a99-0b3f-44b7-be4c-a178d3990564}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceInterfaceClass_Name {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{14c83a99-0b3f-44b7-be4c-a178d3990564}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_Address {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 51
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_DiscoveryMethod {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 52
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_IsEncrypted {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 53
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_IsAuthenticated {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 54
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_IsConnected {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 55
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_IsPaired {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 56
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_Icon {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 57
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_Version {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 65
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_Last_Seen {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 66
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_Last_Connected {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 67
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_IsShowInDisconnectedState {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 68
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_IsLocalMachine {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 70
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_MetadataPath {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 71
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_IsMetadataSearchInProgress {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 72
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_MetadataChecksum {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 73
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_IsNotInterestingForDisplay {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 74
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_LaunchDeviceStageOnDeviceConnect {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 76
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_LaunchDeviceStageFromExplorer {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 77
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_BaselineExperienceId {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 78
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_IsDeviceUniquelyIdentifiable {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 79
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_AssociationArray {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 80
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_DeviceDescription1 {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 81
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_DeviceDescription2 {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 82
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_HasProblem {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 83
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_IsSharedDevice {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 84
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_IsNetworkDevice {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 85
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_IsDefaultDevice {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 86
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_MetadataCabinet {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 87
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_RequiresPairingElevation {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 88
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_ExperienceId {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 89
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_Category {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 90
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_Category_Desc_Singular {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 91
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_Category_Desc_Plural {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 92
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_Category_Icon {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 93
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_CategoryGroup_Desc {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 94
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_CategoryGroup_Icon {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 95
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_PrimaryCategory {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 97
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_UnpairUninstall {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 98
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_RequiresUninstallElevation {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 99
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_DeviceFunctionSubRank {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_AlwaysShowDeviceAsConnected {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 101
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_ConfigFlags {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 105
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_PrivilegedPackageFamilyNames {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 106
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_CustomPrivilegedPackageFamilyNames {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 107
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_IsRebootRequired {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 108
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_FriendlyName {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12288
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_Manufacturer {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8192
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_ModelName {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8194
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_ModelNumber {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8195
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DeviceContainer_InstallInProgress {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{83da6326-97a6-4088-9453-a1923f573b29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_DevQuery_ObjectType {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{13673f42-a3d6-49f6-b4da-ae46e0c5237c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DEVPROP_TYPE => 25

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DEVPROP_TYPEMOD => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_MASK_TYPE => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_MASK_TYPEMOD => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROPID_FIRST_USABLE => 2
;@endregion Constants

;@region Methods
;@endregion Methods
}
