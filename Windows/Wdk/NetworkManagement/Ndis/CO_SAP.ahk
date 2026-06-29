#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct CO_SAP {
    #StructPack 4

    SapType : UInt32

    SapLength : UInt32

    Sap : Int8[1]

}
