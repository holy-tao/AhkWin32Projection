#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_OPERATIONCONTEXT {
    #StructPack 4

    ulUserID : UInt32

    nOperationID : Int8

    nOperationType : Int8

    nClientType : Int8

    fFlags : Int8

}
