#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWindowsDriverUpdate.ahk

/**
 * Contains the properties and methods that are available only from a Windows driver update.
 * @remarks
 * 
  * This interface can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface only if the interface represents a Windows Driver update.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iwindowsdriverupdate2
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IWindowsDriverUpdate2 extends IWindowsDriverUpdate{
    /**
     * The interface identifier for IWindowsDriverUpdate2
     * @type {Guid}
     */
    static IID => Guid("{615c4269-7a48-43bd-96b7-bf6ca27d6c3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 60

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_RebootRequired(retval) {
        result := ComCall(60, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_IsPresent(retval) {
        result := ComCall(61, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStringCollection>} retval 
     * @returns {HRESULT} 
     */
    get_CveIDs(retval) {
        result := ComCall(62, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStringCollection>} pFiles 
     * @returns {HRESULT} 
     */
    CopyToCache(pFiles) {
        result := ComCall(63, this, "ptr", pFiles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
