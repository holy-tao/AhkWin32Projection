#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Contains information about incoming calls.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-interfaceinfo
 * @namespace Windows.Win32.System.Com
 */
export default struct INTERFACEINFO {
    #StructPack 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object.
     */
    pUnk : IUnknown

    /**
     * The identifier of the requested interface.
     */
    iid : Guid

    /**
     * The interface method.
     */
    wMethod : UInt16

}
