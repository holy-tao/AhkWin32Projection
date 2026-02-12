#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\Location.ahk
#Include .\IDebugHostType.ahk
#Include .\IDebugHostSymbol.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostModule extends IDebugHostSymbol{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostModule
     * @type {Guid}
     */
    static IID => Guid("{c9ba3e18-d070-4378-bbd0-34613b346e1e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImageName", "GetBaseLocation", "GetVersion", "FindTypeByName", "FindSymbolByRVA", "FindSymbolByName"]

    /**
     * 
     * @param {Integer} allowPath 
     * @returns {BSTR} 
     */
    GetImageName(allowPath) {
        imageName := BSTR()
        result := ComCall(10, this, "char", allowPath, "ptr", imageName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return imageName
    }

    /**
     * 
     * @returns {Location} 
     */
    GetBaseLocation() {
        moduleBaseLocation := Location()
        result := ComCall(11, this, "ptr", moduleBaseLocation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(fileVersion, productVersion) {
        fileVersionMarshal := fileVersion is VarRef ? "uint*" : "ptr"
        productVersionMarshal := productVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, fileVersionMarshal, fileVersion, productVersionMarshal, productVersion, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} typeName 
     * @returns {IDebugHostType} 
     */
    FindTypeByName(typeName) {
        typeName := typeName is String ? StrPtr(typeName) : typeName

        result := ComCall(13, this, "ptr", typeName, "ptr*", &type := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugHostType(type)
    }

    /**
     * 
     * @param {Integer} rva 
     * @returns {IDebugHostSymbol} 
     */
    FindSymbolByRVA(rva) {
        result := ComCall(14, this, "uint", rva, "ptr*", &symbol := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugHostSymbol(symbol)
    }

    /**
     * 
     * @param {PWSTR} symbolName 
     * @returns {IDebugHostSymbol} 
     */
    FindSymbolByName(symbolName) {
        symbolName := symbolName is String ? StrPtr(symbolName) : symbolName

        result := ComCall(15, this, "ptr", symbolName, "ptr*", &symbol := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugHostSymbol(symbol)
    }
}
