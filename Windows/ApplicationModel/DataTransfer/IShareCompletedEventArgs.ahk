#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ShareTargetInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IShareCompletedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShareCompletedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{4574c442-f913-4f60-9df7-cc4060ab1916}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShareTarget"]

    /**
     * @type {ShareTargetInfo} 
     */
    ShareTarget {
        get => this.get_ShareTarget()
    }

    /**
     * 
     * @returns {ShareTargetInfo} 
     */
    get_ShareTarget() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ShareTargetInfo(value)
    }
}
