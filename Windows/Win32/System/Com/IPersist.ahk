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
     * 
     * @param {Pointer<Guid>} pClassID 
     * @returns {HRESULT} 
     */
    GetClassID(pClassID) {
        result := ComCall(3, this, "ptr", pClassID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
