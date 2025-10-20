#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IADsService.ahk

/**
 * The IADsFileService interface is a dual interface that inherits from IADsService.
 * @remarks
 * 
  * Under the WinNT provider, this interface is implemented on the <b>WinNTService</b> object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsfileservice
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsFileService extends IADsService{
    /**
     * The interface identifier for IADsFileService
     * @type {Guid}
     */
    static IID => Guid("{a89d1900-31ca-11cf-a98a-00aa006bc149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 44

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Description(retval) {
        result := ComCall(44, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(45, this, "ptr", bstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_MaxUserCount(retval) {
        result := ComCall(46, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnMaxUserCount 
     * @returns {HRESULT} 
     */
    put_MaxUserCount(lnMaxUserCount) {
        result := ComCall(47, this, "int", lnMaxUserCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
