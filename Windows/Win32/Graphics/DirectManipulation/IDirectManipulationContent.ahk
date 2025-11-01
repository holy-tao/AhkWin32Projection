#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Encapsulates content inside a viewport, where content represents a visual surface clipped inside the viewport.
 * @remarks
 * 
  * The system provides an implementation of <b>IDirectManipulationContent</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationcontent
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationContent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectManipulationContent
     * @type {Guid}
     */
    static IID => Guid("{b89962cb-3d89-442b-bb58-5098fa0f9f16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContentRect", "SetContentRect", "GetViewport", "GetTag", "SetTag", "GetOutputTransform", "GetContentTransform", "SyncContentTransform"]

    /**
     * 
     * @param {Pointer<RECT>} contentSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getcontentrect
     */
    GetContentRect(contentSize) {
        result := ComCall(3, this, "ptr", contentSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} contentSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-setcontentrect
     */
    SetContentRect(contentSize) {
        result := ComCall(4, this, "ptr", contentSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} object 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getviewport
     */
    GetViewport(riid, object) {
        result := ComCall(5, this, "ptr", riid, "ptr*", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} object 
     * @param {Pointer<Integer>} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-gettag
     */
    GetTag(riid, object, id) {
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", riid, "ptr*", object, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} object 
     * @param {Integer} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-settag
     */
    SetTag(object, id) {
        result := ComCall(7, this, "ptr", object, "uint", id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} matrix 
     * @param {Integer} pointCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getoutputtransform
     */
    GetOutputTransform(matrix, pointCount) {
        matrixMarshal := matrix is VarRef ? "float*" : "ptr"

        result := ComCall(8, this, matrixMarshal, matrix, "uint", pointCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} matrix 
     * @param {Integer} pointCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getcontenttransform
     */
    GetContentTransform(matrix, pointCount) {
        matrixMarshal := matrix is VarRef ? "float*" : "ptr"

        result := ComCall(9, this, matrixMarshal, matrix, "uint", pointCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} matrix 
     * @param {Integer} pointCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-synccontenttransform
     */
    SyncContentTransform(matrix, pointCount) {
        matrixMarshal := matrix is VarRef ? "float*" : "ptr"

        result := ComCall(10, this, matrixMarshal, matrix, "uint", pointCount, "HRESULT")
        return result
    }
}
