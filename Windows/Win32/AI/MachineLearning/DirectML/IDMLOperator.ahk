#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDMLDeviceChild.ahk

/**
 * Represents a DirectML operator.
 * @see https://docs.microsoft.com/windows/win32/api//directml/nn-directml-idmloperator
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class IDMLOperator extends IDMLDeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDMLOperator
     * @type {Guid}
     */
    static IID => Guid("{26caae7a-3081-4633-9581-226fbe57695d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
