#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Provides the CLSID of an object that can be stored persistently in the system. Allows the object to specify which object handler to use in the client process, as it is used in the default implementation of marshaling.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ipersist
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IPersist extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersist
     * @type {Guid}
     */
    static IID => Guid("{0000010c-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClassID"]

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersist-getclassid
     */
    GetClassID() {
        pClassID := Guid()
        result := ComCall(3, this, "ptr", pClassID, "HRESULT")
        return pClassID
    }
}
