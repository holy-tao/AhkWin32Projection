#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\IGameController.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class IGameControllerFactoryManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameControllerFactoryManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{eace5644-19df-4115-b32a-2793e2aea3bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetFactoryControllerFromGameController"]

    /**
     * 
     * @param {ICustomGameControllerFactory} factory 
     * @param {IGameController} gameController 
     * @returns {IGameController} 
     */
    TryGetFactoryControllerFromGameController(factory, gameController) {
        result := ComCall(6, this, "ptr", factory, "ptr", gameController, "ptr*", &factoryController := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IGameController(factoryController)
    }
}
