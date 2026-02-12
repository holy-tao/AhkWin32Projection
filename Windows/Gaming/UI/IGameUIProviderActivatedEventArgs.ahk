#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.UI
 * @version WindowsRuntime 1.4
 */
class IGameUIProviderActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameUIProviderActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a7b3203e-caf7-4ded-bbd2-47de43bb6dd5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GameUIArgs", "ReportCompleted"]

    /**
     * @type {ValueSet} 
     */
    GameUIArgs {
        get => this.get_GameUIArgs()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_GameUIArgs() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(value)
    }

    /**
     * 
     * @param {ValueSet} results 
     * @returns {HRESULT} 
     */
    ReportCompleted(results) {
        result := ComCall(7, this, "ptr", results, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
