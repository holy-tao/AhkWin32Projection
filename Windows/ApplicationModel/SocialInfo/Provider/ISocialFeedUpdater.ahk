#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\SocialFeedItem.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.SocialInfo.Provider
 * @version WindowsRuntime 1.4
 */
class ISocialFeedUpdater extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISocialFeedUpdater
     * @type {Guid}
     */
    static IID => Guid("{7a0c0aa7-ed89-4bd5-a8d9-15f4d9861c10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OwnerRemoteId", "get_Kind", "get_Items", "CommitAsync"]

    /**
     * @type {HSTRING} 
     */
    OwnerRemoteId {
        get => this.get_OwnerRemoteId()
    }

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * @type {IVector<SocialFeedItem>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OwnerRemoteId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<SocialFeedItem>} 
     */
    get_Items() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(SocialFeedItem, value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    CommitAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
