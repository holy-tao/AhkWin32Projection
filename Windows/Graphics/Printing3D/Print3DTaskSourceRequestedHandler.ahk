#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that handles requests for 3D print packages.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtasksourcerequestedhandler
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Print3DTaskSourceRequestedHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Print3DTaskSourceRequestedHandler
     * @type {Guid}
     */
    static IID => Guid("{e9175e70-c917-46de-bb51-d9a94db3711f}")

    /**
     * The class identifier for Print3DTaskSourceRequestedHandler
     * @type {Guid}
     */
    static CLSID => Guid("{e9175e70-c917-46de-bb51-d9a94db3711f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Print3DTaskSourceRequestedArgs} args 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(args) {
        result := ComCall(3, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
