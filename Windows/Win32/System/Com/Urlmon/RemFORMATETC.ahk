#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct RemFORMATETC {
    #StructPack 4

    cfFormat : UInt32

    ptd : UInt32

    dwAspect : UInt32

    lindex : Int32

    tymed : UInt32

}
