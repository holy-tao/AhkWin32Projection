#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDMLDevice.ahk

/**
 * Represents a DirectML device, which is used to create operators, binding tables, command recorders, and other objects. (IDMLDevice1)
 * @see https://learn.microsoft.com/windows/win32/api//content/directml/nn-directml-idmldevice1
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class IDMLDevice1 extends IDMLDevice{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CompileGraph"]

    /**
     * Compiles a graph of DirectML operators into an object that can be dispatched to the GPU.
     * @remarks
     * The DirectML operator graph API provides an abstract way to use DirectML efficiently across diverse hardware. DirectML applies tensor-level optimizations such as choosing the most efficient tensor layout based on the adapter being used. It also applies optimizations such as the removal of Join or Split operators.
     * 
     * We recommend that you apply high-level optimizations before building a DirectML graph. For example, fusing Convolution operators with BatchNorm, constant folding, and common subexpression elimination. The optimizations within DirectML's graph optimizer are intended to complement such device-independent optimizations, which are typically handled generically by machine learning frameworks.
     * @param {Pointer<DML_GRAPH_DESC>} desc Type: **[DML_GRAPH_DESC](/windows/win32/api/directml/ns-directml-dml_graph_desc)\***
     * 
     * A description of the graph to compile. See [DML_GRAPH_DESC](/windows/win32/api/directml/ns-directml-dml_graph_desc).
     * @param {Integer} flags Type: [**DML_EXECUTION_FLAGS**](/windows/win32/api/directml/ne-directml-dml_execution_flags)
     * 
     * Any flags to control the execution of this operator.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in <i>ppv</i>. This is expected to be the GUID of [IDMLCompiledOperator](/windows/win32/api/directml/nn-directml-idmlcompiledoperator).
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the compiled operator. This is the address of a pointer to an [IDMLCompiledOperator](/windows/win32/api/directml/nn-directml-idmlcompiledoperator), representing  the compiled operator created.
     * @see https://learn.microsoft.com/windows/win32/api//content/directml/nf-directml-idmldevice1-compilegraph
     */
    CompileGraph(desc, flags, riid) {
        result := ComCall(17, this, "ptr", desc, "int", flags, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }
}
