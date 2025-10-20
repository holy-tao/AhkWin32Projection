#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDMLDevice.ahk

/**
 * Represents a DirectML device, which is used to create operators, binding tables, command recorders, and other objects.
 * @see https://docs.microsoft.com/windows/win32/api//directml/nn-directml-idmldevice1
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class IDMLDevice1 extends IDMLDevice{
    /**
     * The interface identifier for IDMLDevice1
     * @type {Guid}
     */
    static IID => Guid("{a0884f9a-d2be-4355-aa5d-5901281ad1d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * 
     * @param {Pointer<DML_GRAPH_DESC>} desc 
     * @param {Integer} flags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CompileGraph(desc, flags, riid, ppv) {
        result := ComCall(17, this, "ptr", desc, "int", flags, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
