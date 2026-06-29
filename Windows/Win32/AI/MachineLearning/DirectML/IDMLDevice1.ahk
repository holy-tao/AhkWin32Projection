#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DML_GRAPH_DESC.ahk" { DML_GRAPH_DESC }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DML_EXECUTION_FLAGS.ahk" { DML_EXECUTION_FLAGS }
#Import ".\IDMLDevice.ahk" { IDMLDevice }

/**
 * Represents a DirectML device, which is used to create operators, binding tables, command recorders, and other objects. (IDMLDevice1)
 * @see https://learn.microsoft.com/windows/win32/api/directml/nn-directml-idmldevice1
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct IDMLDevice1 extends IDMLDevice {
    /**
     * The interface identifier for IDMLDevice1
     * @type {Guid}
     */
    static IID := Guid("{a0884f9a-d2be-4355-aa5d-5901281ad1d2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDMLDevice1 interfaces
    */
    struct Vtbl extends IDMLDevice.Vtbl {
        CompileGraph : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDMLDevice1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Compiles a graph of DirectML operators into an object that can be dispatched to the GPU.
     * @remarks
     * The DirectML operator graph API provides an abstract way to use DirectML efficiently across diverse hardware. DirectML applies tensor-level optimizations such as choosing the most efficient tensor layout based on the adapter being used. It also applies optimizations such as the removal of Join or Split operators.
     * 
     * We recommend that you apply high-level optimizations before building a DirectML graph. For example, fusing Convolution operators with BatchNorm, constant folding, and common subexpression elimination. The optimizations within DirectML's graph optimizer are intended to complement such device-independent optimizations, which are typically handled generically by machine learning frameworks.
     * @param {Pointer<DML_GRAPH_DESC>} desc Type: **[DML_GRAPH_DESC](/windows/win32/api/directml/ns-directml-dml_graph_desc)\***
     * 
     * A description of the graph to compile. See [DML_GRAPH_DESC](/windows/win32/api/directml/ns-directml-dml_graph_desc).
     * @param {DML_EXECUTION_FLAGS} flags Type: [**DML_EXECUTION_FLAGS**](/windows/win32/api/directml/ne-directml-dml_execution_flags)
     * 
     * Any flags to control the execution of this operator.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in <i>ppv</i>. This is expected to be the GUID of [IDMLCompiledOperator](/windows/win32/api/directml/nn-directml-idmlcompiledoperator).
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the compiled operator. This is the address of a pointer to an [IDMLCompiledOperator](/windows/win32/api/directml/nn-directml-idmlcompiledoperator), representing  the compiled operator created.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice1-compilegraph
     */
    CompileGraph(desc, flags, riid) {
        result := ComCall(17, this, DML_GRAPH_DESC.Ptr, desc, DML_EXECUTION_FLAGS, flags, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IDMLDevice1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CompileGraph := CallbackCreate(GetMethod(implObj, "CompileGraph"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CompileGraph)
    }
}
