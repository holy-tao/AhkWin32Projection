#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Graphics\SizeInt32.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionDrawingSurface2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionDrawingSurface2
     * @type {Guid}
     */
    static IID => Guid("{fad0e88b-e354-44e8-8e3d-c4880d5a213f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SizeInt32", "Resize", "Scroll", "ScrollRect", "ScrollWithClip", "ScrollRectWithClip"]

    /**
     * @type {SizeInt32} 
     */
    SizeInt32 {
        get => this.get_SizeInt32()
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_SizeInt32() {
        value := SizeInt32()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * These flags specify how a video source is rendered if its size does not match the output dimensions.
     * @remarks
     * The following images show the effects of these flags.
     * 
     * ![resize flags](images/stretch14.png)
     * @param {SizeInt32} sizePixels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/resize-flags
     */
    Resize(sizePixels) {
        result := ComCall(7, this, "ptr", sizePixels, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * To create a scroll bar control using the CreateWindow or CreateWindowEx function specify the SCROLLBAR class, appropriate window style constants, and a combination of the following scroll bar control styles.
     * @param {PointInt32} offset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Controls/scroll-bar-control-styles
     */
    Scroll(offset) {
        result := ComCall(8, this, "ptr", offset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * To create a scroll bar control using the CreateWindow or CreateWindowEx function specify the SCROLLBAR class, appropriate window style constants, and a combination of the following scroll bar control styles.
     * @param {PointInt32} offset 
     * @param {RectInt32} scrollRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Controls/scroll-bar-control-styles
     */
    ScrollRect(offset, scrollRect) {
        result := ComCall(9, this, "ptr", offset, "ptr", scrollRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointInt32} offset 
     * @param {RectInt32} clipRect 
     * @returns {HRESULT} 
     */
    ScrollWithClip(offset, clipRect) {
        result := ComCall(10, this, "ptr", offset, "ptr", clipRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointInt32} offset 
     * @param {RectInt32} clipRect 
     * @param {RectInt32} scrollRect 
     * @returns {HRESULT} 
     */
    ScrollRectWithClip(offset, clipRect, scrollRect) {
        result := ComCall(11, this, "ptr", offset, "ptr", clipRect, "ptr", scrollRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
