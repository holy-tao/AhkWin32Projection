#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1CommandSink2.ahk" { ID2D1CommandSink2 }
#Import ".\ID2D1SpriteBatch.ahk" { ID2D1SpriteBatch }
#Import ".\D2D1_BITMAP_INTERPOLATION_MODE.ahk" { D2D1_BITMAP_INTERPOLATION_MODE }
#Import ".\D2D1_SPRITE_OPTIONS.ahk" { D2D1_SPRITE_OPTIONS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1Bitmap.ahk" { ID2D1Bitmap }

/**
 * This interface performs all the same functions as the existing ID2D1CommandSink2 interface. It also enables access to sprite batch rendering.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1commandsink3
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1CommandSink3 extends ID2D1CommandSink2 {
    /**
     * The interface identifier for ID2D1CommandSink3
     * @type {Guid}
     */
    static IID := Guid("{18079135-4cf3-4868-bc8e-06067e6d242d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1CommandSink3 interfaces
    */
    struct Vtbl extends ID2D1CommandSink2.Vtbl {
        DrawSpriteBatch : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1CommandSink3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Renders part or all of the given sprite batch to the device context using the specified drawing options. (ID2D1CommandSink3.DrawSpriteBatch)
     * @param {ID2D1SpriteBatch} spriteBatch Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1spritebatch">ID2D1SpriteBatch</a>*</b>
     * 
     * The sprite batch to draw.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * The index of the first sprite in the sprite batch to draw.
     * @param {Integer} spriteCount Type: <b>UINT32</b>
     * 
     * The number of sprites to draw.
     * @param {ID2D1Bitmap} _bitmap Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>*</b>
     * 
     * The bitmap from which the sprites are to be sourced. Each sprite’s source rectangle refers to a portion of this bitmap.
     * @param {D2D1_BITMAP_INTERPOLATION_MODE} _interpolationMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_bitmap_interpolation_mode">D2D1_BITMAP_INTERPOLATION_MODE</a></b>
     * 
     * The interpolation mode to use when drawing this sprite batch. This determines how Direct2D interpolates pixels within the drawn sprites if scaling is performed.
     * @param {D2D1_SPRITE_OPTIONS} spriteOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_sprite_options">D2D1_SPRITE_OPTIONS</a></b>
     * 
     * The additional drawing options, if any, to be used for this sprite batch.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1commandsink3-drawspritebatch
     */
    DrawSpriteBatch(spriteBatch, startIndex, spriteCount, _bitmap, _interpolationMode, spriteOptions) {
        result := ComCall(32, this, "ptr", spriteBatch, "uint", startIndex, "uint", spriteCount, "ptr", _bitmap, D2D1_BITMAP_INTERPOLATION_MODE, _interpolationMode, D2D1_SPRITE_OPTIONS, spriteOptions, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1CommandSink3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DrawSpriteBatch := CallbackCreate(GetMethod(implObj, "DrawSpriteBatch"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DrawSpriteBatch)
    }
}
