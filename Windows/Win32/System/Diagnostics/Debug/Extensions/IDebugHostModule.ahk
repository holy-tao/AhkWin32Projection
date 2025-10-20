#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostModule extends IDebugHostSymbol{
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
     * 
     * @param {Integer} allowPath 
     * @param {Pointer<BSTR>} imageName 
     * @returns {HRESULT} 
     */
    GetImageName(allowPath, imageName) {
        result := ComCall(10, this, "char", allowPath, "ptr", imageName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Location>} moduleBaseLocation 
     * @returns {HRESULT} 
     */
    GetBaseLocation(moduleBaseLocation) {
        result := ComCall(11, this, "ptr", moduleBaseLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @param {Pointer<UInt64>} fileVersion 
     * @param {Pointer<UInt64>} productVersion 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(fileVersion, productVersion) {
        result := ComCall(12, this, "uint*", fileVersion, "uint*", productVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} typeName 
     * @param {Pointer<IDebugHostType>} type 
     * @returns {HRESULT} 
     */
    FindTypeByName(typeName, type) {
        typeName := typeName is String ? StrPtr(typeName) : typeName

        result := ComCall(13, this, "ptr", typeName, "ptr", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rva 
     * @param {Pointer<IDebugHostSymbol>} symbol 
     * @returns {HRESULT} 
     */
    FindSymbolByRVA(rva, symbol) {
        result := ComCall(14, this, "uint", rva, "ptr", symbol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} symbolName 
     * @param {Pointer<IDebugHostSymbol>} symbol 
     * @returns {HRESULT} 
     */
    FindSymbolByName(symbolName, symbol) {
        symbolName := symbolName is String ? StrPtr(symbolName) : symbolName

        result := ComCall(15, this, "ptr", symbolName, "ptr", symbol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
