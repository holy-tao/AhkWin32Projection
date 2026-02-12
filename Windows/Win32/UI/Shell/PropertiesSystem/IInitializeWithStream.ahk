#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that initializes a handler, such as a property handler, thumbnail handler, or preview handler, with a stream.
 * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nn-propsys-iinitializewithstream
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IInitializeWithStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInitializeWithStream
     * @type {Guid}
     */
    static IID => Guid("{b824b49d-22ac-4161-ac8a-9916e8fa3f7f}")

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
     * Initializes a handler with a stream.
     * @remarks
     * This method is preferred to <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-iinitializewithfile-initialize">Initialize</a> due to its ability to use streams that are not accessible through a Win32 path, such as the contents of a compressed file with a .zip file name extension.
     * 
     * The stream pointed to by <i>pstream</i> must remain open for the lifetime of the handler or until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb761470(v=vs.85)">IPropertyStore::Commit</a> is called.
     * 
     * When first opened, the source stream reference points to the beginning of the stream. The handler can seek and read from the stream at any time. A handler can be implemented to read all properties from the stream during <b>Initialize</b> or it can wait until the calling process attempts to enumerate or read properties before fetching them from the stream.
     * 
     * A handler instance should be initialized only once in its lifetime. Attempts by the caller to reinitialize the handler should result in the error <c>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</c>.
     * @param {IStream} pstream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface that represents the stream source.
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * 
     * One of the following <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM</a> values that indicates the access mode for <i>pstream</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-iinitializewithstream-initialize
     */
    Initialize(pstream, grfMode) {
        result := ComCall(3, this, "ptr", pstream, "uint", grfMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
