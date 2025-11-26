#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to initialize a handler, such as a property handler, thumbnail handler, or preview handler, with a file path.
 * @remarks
 * 
 * Whenever possible, it is recommended that initialization be done through a stream using <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-iinitializewithstream">IInitializeWithStream</a>. Benefits of this include increased security and stability.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-iinitializewithfile
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IInitializeWithFile extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInitializeWithFile
     * @type {Guid}
     */
    static IID => Guid("{b7d14566-0509-4cce-a71f-0a554233bd9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes a handler with a file path.
     * @param {PWSTR} pszFilePath Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the file path as a null-terminated Unicode string.
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * 
     * One of the following <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM</a> values that indicates the access mode for <i>pszFilePath</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-iinitializewithfile-initialize
     */
    Initialize(pszFilePath, grfMode) {
        pszFilePath := pszFilePath is String ? StrPtr(pszFilePath) : pszFilePath

        result := ComCall(3, this, "ptr", pszFilePath, "uint", grfMode, "HRESULT")
        return result
    }
}
