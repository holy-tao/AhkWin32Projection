#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackList3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackList3
     * @type {Guid}
     */
    static IID => Guid("{dd24bba9-bc47-4463-aa90-c18b7e5ffde1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxPlayedItemsToKeepOpen", "put_MaxPlayedItemsToKeepOpen"]

    /**
     * @type {IReference<Integer>} 
     */
    MaxPlayedItemsToKeepOpen {
        get => this.get_MaxPlayedItemsToKeepOpen()
        set => this.put_MaxPlayedItemsToKeepOpen(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxPlayedItemsToKeepOpen() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxPlayedItemsToKeepOpen(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
