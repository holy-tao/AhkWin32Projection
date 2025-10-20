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
     * 
     * @param {Pointer<RECT>} contentSize 
     * @returns {HRESULT} 
     */
    GetContentRect(contentSize) {
        result := ComCall(3, this, "ptr", contentSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} contentSize 
     * @returns {HRESULT} 
     */
    SetContentRect(contentSize) {
        result := ComCall(4, this, "ptr", contentSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} object 
     * @returns {HRESULT} 
     */
    GetViewport(riid, object) {
        result := ComCall(5, this, "ptr", riid, "ptr", object, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} object 
     * @param {Pointer<UInt32>} id 
     * @returns {HRESULT} 
     */
    GetTag(riid, object, id) {
        result := ComCall(6, this, "ptr", riid, "ptr", object, "uint*", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} object 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    SetTag(object, id) {
        result := ComCall(7, this, "ptr", object, "uint", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} matrix 
     * @param {Integer} pointCount 
     * @returns {HRESULT} 
     */
    GetOutputTransform(matrix, pointCount) {
        result := ComCall(8, this, "float*", matrix, "uint", pointCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} matrix 
     * @param {Integer} pointCount 
     * @returns {HRESULT} 
     */
    GetContentTransform(matrix, pointCount) {
        result := ComCall(9, this, "float*", matrix, "uint", pointCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} matrix 
     * @param {Integer} pointCount 
     * @returns {HRESULT} 
     */
    SyncContentTransform(matrix, pointCount) {
        result := ComCall(10, this, "float*", matrix, "uint", pointCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
