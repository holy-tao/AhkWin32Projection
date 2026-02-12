#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Deferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class ITargetedContentChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetedContentChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{99d488c9-587e-4586-8ef7-b54ca9453a16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeferral", "get_HasPreviousContentExpired"]

    /**
     * @type {Boolean} 
     */
    HasPreviousContentExpired {
        get => this.get_HasPreviousContentExpired()
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasPreviousContentExpired() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
