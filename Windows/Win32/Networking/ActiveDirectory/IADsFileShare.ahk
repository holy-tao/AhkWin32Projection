#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IADs.ahk

/**
 * The IADsFileShare interface is a dual interface that inherits from IADs. It is designed for representing a published file share across the network. Call the methods on IADsFileShare to access or publish data about a file share point.
 * @remarks
 * 
  * <b>IADsFileShare</b> is supported by WinNT system provider only. Using the WinNT provider, you can also bind to a FPNW share by substituting "FPNW" for "LanmanServer" in the code examples below.
  * 
  * To bind to a file share, using the WinNT system provider, you can explicitly bind to the file service "LanmanServer" on the host machine, and then enumerate the container to reach the file share of interest, or bind directly to the file share.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsfileshare
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsFileShare extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsFileShare
     * @type {Guid}
     */
    static IID => Guid("{eb6dcaf0-4b83-11cf-a995-00aa006bc149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentUserCount", "get_Description", "put_Description", "get_HostComputer", "put_HostComputer", "get_Path", "put_Path", "get_MaxUserCount", "put_MaxUserCount"]

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_CurrentUserCount(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Description(retval) {
        result := ComCall(21, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(22, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_HostComputer(retval) {
        result := ComCall(23, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrHostComputer 
     * @returns {HRESULT} 
     */
    put_HostComputer(bstrHostComputer) {
        bstrHostComputer := bstrHostComputer is String ? BSTR.Alloc(bstrHostComputer).Value : bstrHostComputer

        result := ComCall(24, this, "ptr", bstrHostComputer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Path(retval) {
        result := ComCall(25, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPath 
     * @returns {HRESULT} 
     */
    put_Path(bstrPath) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(26, this, "ptr", bstrPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_MaxUserCount(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnMaxUserCount 
     * @returns {HRESULT} 
     */
    put_MaxUserCount(lnMaxUserCount) {
        result := ComCall(28, this, "int", lnMaxUserCount, "HRESULT")
        return result
    }
}
