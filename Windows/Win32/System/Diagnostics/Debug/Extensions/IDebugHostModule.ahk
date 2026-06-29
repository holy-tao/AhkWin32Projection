#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\Location.ahk" { Location }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostSymbol.ahk" { IDebugHostSymbol }
#Import ".\IDebugHostType.ahk" { IDebugHostType }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostModule extends IDebugHostSymbol {
    /**
     * The interface identifier for IDebugHostModule
     * @type {Guid}
     */
    static IID := Guid("{c9ba3e18-d070-4378-bbd0-34613b346e1e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostModule interfaces
    */
    struct Vtbl extends IDebugHostSymbol.Vtbl {
        GetImageName     : IntPtr
        GetBaseLocation  : IntPtr
        GetVersion       : IntPtr
        FindTypeByName   : IntPtr
        FindSymbolByRVA  : IntPtr
        FindSymbolByName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostModule.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} allowPath 
     * @returns {BSTR} 
     */
    GetImageName(allowPath) {
        imageName := BSTR.Owned()
        result := ComCall(10, this, "char", allowPath, BSTR.Ptr, imageName, "HRESULT")
        return imageName
    }

    /**
     * 
     * @returns {Location} 
     */
    GetBaseLocation() {
        moduleBaseLocation := Location()
        result := ComCall(11, this, Location.Ptr, moduleBaseLocation, "HRESULT")
        return moduleBaseLocation
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getversionexa">GetVersionEx</a> function was developed because many existing applications err when examining the packed <b>DWORD</b> value returned by 
     * <b>GetVersion</b>, transposing the major and minor version numbers. 
     * <b>GetVersionEx</b> forces applications to explicitly examine each element of version information. 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-verifyversioninfoa">VerifyVersionInfo</a> eliminates further potential for error by comparing the required system version with the current system version for you.
     * @param {Pointer<Integer>} fileVersion 
     * @param {Pointer<Integer>} productVersion 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(fileVersion, productVersion) {
        fileVersionMarshal := fileVersion is VarRef ? "uint*" : "ptr"
        productVersionMarshal := productVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, fileVersionMarshal, fileVersion, productVersionMarshal, productVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} typeName 
     * @returns {IDebugHostType} 
     */
    FindTypeByName(typeName) {
        typeName := typeName is String ? StrPtr(typeName) : typeName

        result := ComCall(13, this, "ptr", typeName, "ptr*", &type := 0, "HRESULT")
        return IDebugHostType(type)
    }

    /**
     * 
     * @param {Integer} rva 
     * @returns {IDebugHostSymbol} 
     */
    FindSymbolByRVA(rva) {
        result := ComCall(14, this, "uint", rva, "ptr*", &symbol := 0, "HRESULT")
        return IDebugHostSymbol(symbol)
    }

    /**
     * 
     * @param {PWSTR} symbolName 
     * @returns {IDebugHostSymbol} 
     */
    FindSymbolByName(symbolName) {
        symbolName := symbolName is String ? StrPtr(symbolName) : symbolName

        result := ComCall(15, this, "ptr", symbolName, "ptr*", &symbol := 0, "HRESULT")
        return IDebugHostSymbol(symbol)
    }

    Query(iid) {
        if (IDebugHostModule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetImageName := CallbackCreate(GetMethod(implObj, "GetImageName"), flags, 3)
        this.vtbl.GetBaseLocation := CallbackCreate(GetMethod(implObj, "GetBaseLocation"), flags, 2)
        this.vtbl.GetVersion := CallbackCreate(GetMethod(implObj, "GetVersion"), flags, 3)
        this.vtbl.FindTypeByName := CallbackCreate(GetMethod(implObj, "FindTypeByName"), flags, 3)
        this.vtbl.FindSymbolByRVA := CallbackCreate(GetMethod(implObj, "FindSymbolByRVA"), flags, 3)
        this.vtbl.FindSymbolByName := CallbackCreate(GetMethod(implObj, "FindSymbolByName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetImageName)
        CallbackFree(this.vtbl.GetBaseLocation)
        CallbackFree(this.vtbl.GetVersion)
        CallbackFree(this.vtbl.FindTypeByName)
        CallbackFree(this.vtbl.FindSymbolByRVA)
        CallbackFree(this.vtbl.FindSymbolByName)
    }
}
