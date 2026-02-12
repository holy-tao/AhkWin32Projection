#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IExtensionValidation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExtensionValidation
     * @type {Guid}
     */
    static IID => Guid("{7d33f73d-8525-4e0f-87db-830288baff44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Validate", "DisplayName"]

    /**
     * The ValidateBitmapInfoHeader function checks a BITMAPINFOHEADER structure for certain common errors that can cause buffer overruns or integer overflows.
     * @remarks
     * This function guards against the following errors:
     * 
     * -   Arithmetic overflow in the structure size or an invalid structure size.
     * -   Invalid value for the **biClrUsed** member.
     * -   Arithmetic overflow in the image size (**biSizeImage**).
     * -   Invalid values for the image size (**biSizeImage**) for RGB formats.
     * 
     * The function does not check whether the structure describes a valid video format.
     * @param {Pointer<Guid>} extensionGuid 
     * @param {PWSTR} extensionModulePath 
     * @param {Integer} extensionFileVersionMS 
     * @param {Integer} extensionFileVersionLS 
     * @param {IHTMLDocument2} htmlDocumentTop 
     * @param {IHTMLDocument2} htmlDocumentSubframe 
     * @param {IHTMLElement} htmlElement 
     * @param {Integer} contexts 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/validatebitmapinfoheader
     */
    Validate(extensionGuid, extensionModulePath, extensionFileVersionMS, extensionFileVersionLS, htmlDocumentTop, htmlDocumentSubframe, htmlElement, contexts) {
        extensionModulePath := extensionModulePath is String ? StrPtr(extensionModulePath) : extensionModulePath

        result := ComCall(3, this, "ptr", extensionGuid, "ptr", extensionModulePath, "uint", extensionFileVersionMS, "uint", extensionFileVersionLS, "ptr", htmlDocumentTop, "ptr", htmlDocumentSubframe, "ptr", htmlElement, "int", contexts, "int*", &results := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return results
    }

    /**
     * DisplayName Property (SqlService Class)
     * @remarks
     * This string has a maximum length of 256 characters. The name is case-preserved in the [!INCLUDE[ssNoVersion](../../../includes/ssnoversion-md.md)] Configuration Manager. However, display name comparisons are always case-insensitive.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/wmi-provider-configuration-classes/sqlservice-class/displayname-property-sqlservice-class
     */
    DisplayName() {
        result := ComCall(4, this, "ptr*", &displayName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return displayName
    }
}
