#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Deferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundTransferRangesDownloadedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTransferRangesDownloadedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{3ebc7453-bf48-4a88-9248-b0c165184f5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WasDownloadRestarted", "get_AddedRanges", "GetDeferral"]

    /**
     * @type {Boolean} 
     */
    WasDownloadRestarted {
        get => this.get_WasDownloadRestarted()
    }

    /**
     * @type {IVector<BackgroundTransferFileRange>} 
     */
    AddedRanges {
        get => this.get_AddedRanges()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WasDownloadRestarted() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<BackgroundTransferFileRange>} 
     */
    get_AddedRanges() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetBackgroundTransferFileRange(), value)
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }
}
