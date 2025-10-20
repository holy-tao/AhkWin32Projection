#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages the application list.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiapplicationlist
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIApplicationList extends IDispatch{
    /**
     * The interface identifier for IRDPSRAPIApplicationList
     * @type {Guid}
     */
    static IID => Guid("{d4b4aeb3-22dc-4837-b3b6-42ea2517849a}")

    /**
     * The class identifier for RDPSRAPIApplicationList
     * @type {Guid}
     */
    static CLSID => Guid("{9e31c815-7433-4876-97fb-ed59fe2baa22}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get__NewEnum(retval) {
        result := ComCall(7, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} item 
     * @param {Pointer<IRDPSRAPIApplication>} pApplication 
     * @returns {HRESULT} 
     */
    get_Item(item, pApplication) {
        result := ComCall(8, this, "int", item, "ptr", pApplication, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
