#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a one-to-one mapping to a sharable window.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiwindow
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIWindow extends IDispatch{
    /**
     * The interface identifier for IRDPSRAPIWindow
     * @type {Guid}
     */
    static IID => Guid("{beafe0f9-c77b-4933-ba9f-a24cddcc27cf}")

    /**
     * The class identifier for RDPSRAPIWindow
     * @type {Guid}
     */
    static CLSID => Guid("{03cf46db-ce45-4d36-86ed-ed28b74398bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    get_Id(pRetVal) {
        result := ComCall(7, this, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIApplication>} pApplication 
     * @returns {HRESULT} 
     */
    get_Application(pApplication) {
        result := ComCall(8, this, "ptr", pApplication, "int")
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
     * @returns {HRESULT} 
     */
    Show() {
        result := ComCall(12, this, "int")
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
        result := ComCall(13, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
