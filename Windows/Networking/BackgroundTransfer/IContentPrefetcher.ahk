#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The IContentPrefetcherTaskTrigger interface supports content prefetching behavior and performance testing by defining methods that allow you to verify that an installed app package is registered for this background task and manually trigger its content prefetch operations.
 * @see https://learn.microsoft.com/windows/win32/api//content/icontentprefetchertasktrigger/nn-icontentprefetchertasktrigger-icontentprefetchertasktrigger
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IContentPrefetcher extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentPrefetcher
     * @type {Guid}
     */
    static IID => Guid("{a8d6f754-7dc1-4cd9-8810-2a6aa9417e11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentUris", "put_IndirectContentUri", "get_IndirectContentUri"]

    /**
     * @type {IVector<Uri>} 
     */
    ContentUris {
        get => this.get_ContentUris()
    }

    /**
     * @type {Uri} 
     */
    IndirectContentUri {
        get => this.get_IndirectContentUri()
        set => this.put_IndirectContentUri(value)
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_ContentUris() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Uri, value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_IndirectContentUri(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_IndirectContentUri() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }
}
