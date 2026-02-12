#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PlayToManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class IPlayToManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayToManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{64e6a887-3982-4f3b-ba20-6155e435325b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentView", "ShowPlayToUI"]

    /**
     * 
     * @returns {PlayToManager} 
     */
    GetForCurrentView() {
        result := ComCall(6, this, "ptr*", &playToManager_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayToManager(playToManager_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowPlayToUI() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
