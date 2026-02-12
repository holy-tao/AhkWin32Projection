#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class IPlaybackRateChangeRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlaybackRateChangeRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{0f5661ae-2c88-4cca-8540-d586095d13a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Rate"]

    /**
     * @type {Float} 
     */
    Rate {
        get => this.get_Rate()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Rate() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
