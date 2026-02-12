#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to initialize a handler, such as a property handler, thumbnail handler, or preview handler, with a file path.
 * @remarks
 * Whenever possible, it is recommended that initialization be done through a stream using <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-iinitializewithstream">IInitializeWithStream</a>. Benefits of this include increased security and stability.
 * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nn-propsys-iinitializewithfile
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
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-iinitializewithstream-initialize">Initialize</a> is preferred to this method because of its ability to use files that are not accessible through a Win32 path, such as the contents of a compressed file with a .zip file name extension. Use <b>IInitializeWithFile::Initialize</b> only when the API used by the handler to access the file accepts file paths only.
     * 
     * The file pointed to by <i>pszFilePath</i> must remain open for the lifetime of the handler or until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb761470(v=vs.85)">IPropertyStore::Commit</a> is called.
     * 
     * If the file cannot be opened according to the method's parameter values, this method returns a suitable error code.
     * 
     * A handler instance should be initialized only once in its lifetime. Attempts by the calling application to reinitialize the handler should result in the error <c>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</c>.
     * @param {PWSTR} pszFilePath Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the file path as a null-terminated Unicode string.
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * 
     * One of the following <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM</a> values that indicates the access mode for <i>pszFilePath</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-iinitializewithfile-initialize
     */
    Initialize(pszFilePath, grfMode) {
        pszFilePath := pszFilePath is String ? StrPtr(pszFilePath) : pszFilePath

        result := ComCall(3, this, "ptr", pszFilePath, "uint", grfMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
