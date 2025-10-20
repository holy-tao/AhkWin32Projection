#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMExtensionFileExtensionInfo extends IUnknown{
    /**
     * The interface identifier for IPMExtensionFileExtensionInfo
     * @type {Guid}
     */
    static IID => Guid("{6b87cb6c-0b88-4989-a4ec-033714f710d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    get_Name(pName) {
        result := ComCall(3, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDisplayName 
     * @returns {HRESULT} 
     */
    get_DisplayName(pDisplayName) {
        result := ComCall(4, this, "ptr", pDisplayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LogoSize 
     * @param {Pointer<BSTR>} pLogo 
     * @returns {HRESULT} 
     */
    get_Logo(LogoSize, pLogo) {
        result := ComCall(5, this, "int", LogoSize, "ptr", pLogo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} FileType 
     * @param {Pointer<BSTR>} pContentType 
     * @returns {HRESULT} 
     */
    get_ContentType(FileType, pContentType) {
        FileType := FileType is String ? BSTR.Alloc(FileType).Value : FileType

        result := ComCall(6, this, "ptr", FileType, "ptr", pContentType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} ContentType 
     * @param {Pointer<BSTR>} pFileType 
     * @returns {HRESULT} 
     */
    get_FileType(ContentType, pFileType) {
        ContentType := ContentType is String ? BSTR.Alloc(ContentType).Value : ContentType

        result := ComCall(7, this, "ptr", ContentType, "ptr", pFileType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(8, this, "ptr", pImageUrn, "ptr", pParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbTypes 
     * @param {Pointer<BSTR>} ppTypes 
     * @returns {HRESULT} 
     */
    get_AllFileTypes(pcbTypes, ppTypes) {
        result := ComCall(9, this, "uint*", pcbTypes, "ptr", ppTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
