#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IADs.ahk

/**
 * The IADsFileShare interface is a dual interface that inherits from IADs. It is designed for representing a published file share across the network. Call the methods on IADsFileShare to access or publish data about a file share point.
 * @remarks
 * <b>IADsFileShare</b> is supported by WinNT system provider only. Using the WinNT provider, you can also bind to a FPNW share by substituting "FPNW" for "LanmanServer" in the code examples below.
 * 
 * To bind to a file share, using the WinNT system provider, you can explicitly bind to the file service "LanmanServer" on the host machine, and then enumerate the container to reach the file share of interest, or bind directly to the file share.
 * @see https://learn.microsoft.com/windows/win32/api//content/iads/nn-iads-iadsfileshare
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
     * @type {Integer} 
     */
    CurrentUserCount {
        get => this.get_CurrentUserCount()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    HostComputer {
        get => this.get_HostComputer()
        set => this.put_HostComputer(value)
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * @type {Integer} 
     */
    MaxUserCount {
        get => this.get_MaxUserCount()
        set => this.put_MaxUserCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentUserCount() {
        result := ComCall(20, this, "int*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        retval := BSTR()
        result := ComCall(21, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        if(bstrDescription is String) {
            pin := BSTR.Alloc(bstrDescription)
            bstrDescription := pin.Value
        }

        result := ComCall(22, this, "ptr", bstrDescription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_HostComputer() {
        retval := BSTR()
        result := ComCall(23, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrHostComputer 
     * @returns {HRESULT} 
     */
    put_HostComputer(bstrHostComputer) {
        if(bstrHostComputer is String) {
            pin := BSTR.Alloc(bstrHostComputer)
            bstrHostComputer := pin.Value
        }

        result := ComCall(24, this, "ptr", bstrHostComputer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        retval := BSTR()
        result := ComCall(25, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPath 
     * @returns {HRESULT} 
     */
    put_Path(bstrPath) {
        if(bstrPath is String) {
            pin := BSTR.Alloc(bstrPath)
            bstrPath := pin.Value
        }

        result := ComCall(26, this, "ptr", bstrPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxUserCount() {
        result := ComCall(27, this, "int*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {Integer} lnMaxUserCount 
     * @returns {HRESULT} 
     */
    put_MaxUserCount(lnMaxUserCount) {
        result := ComCall(28, this, "int", lnMaxUserCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
