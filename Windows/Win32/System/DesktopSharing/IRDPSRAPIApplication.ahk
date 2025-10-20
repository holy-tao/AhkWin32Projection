#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Groups the sharable windows within a process. Each application object contains a list of window objects. If an application object is shared, all its windows are shared.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiapplication
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIApplication extends IDispatch{
    /**
     * The interface identifier for IRDPSRAPIApplication
     * @type {Guid}
     */
    static IID => Guid("{41e7a09d-eb7a-436e-935d-780ca2628324}")

    /**
     * The class identifier for RDPSRAPIApplication
     * @type {Guid}
     */
    static CLSID => Guid("{c116a484-4b25-4b9f-8a54-b934b06e57fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IRDPSRAPIWindowList>} pWindowList 
     * @returns {HRESULT} 
     */
    get_Windows(pWindowList) {
        result := ComCall(7, this, "ptr", pWindowList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    get_Id(pRetVal) {
        result := ComCall(8, this, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pRetVal 
     * @returns {HRESULT} 
     */
    get_Shared(pRetVal) {
        result := ComCall(9, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} NewVal 
     * @returns {HRESULT} 
     */
    put_Shared(NewVal) {
        result := ComCall(10, this, "short", NewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pRetVal 
     * @returns {HRESULT} 
     */
    get_Name(pRetVal) {
        result := ComCall(11, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    get_Flags(pdwFlags) {
        result := ComCall(12, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
