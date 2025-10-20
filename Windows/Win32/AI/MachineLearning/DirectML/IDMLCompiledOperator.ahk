#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDMLDispatchable.ahk

/**
 * Represents a compiled, efficient form of an operator suitable for execution on the GPU. To create this object, call IDMLDevice::CompileOperator.
 * @see https://docs.microsoft.com/windows/win32/api//directml/nn-directml-idmlcompiledoperator
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class IDMLCompiledOperator extends IDMLDispatchable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDMLCompiledOperator
     * @type {Guid}
     */
    static IID => Guid("{6b15e56a-bf5c-4902-92d8-da3a650afea4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
