#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1DeviceContext2.ahk" { ID2D1DeviceContext2 }
#Import ".\ID2D1SpriteBatch.ahk" { ID2D1SpriteBatch }
#Import ".\D2D1_BITMAP_INTERPOLATION_MODE.ahk" { D2D1_BITMAP_INTERPOLATION_MODE }
#Import ".\D2D1_SPRITE_OPTIONS.ahk" { D2D1_SPRITE_OPTIONS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1Bitmap.ahk" { ID2D1Bitmap }

/**
 * This interface performs all the same functions as the ID2D1DeviceContext2 interface, plus it enables functionality for creating and drawing sprite batches.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1devicecontext3
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1DeviceContext3 extends ID2D1DeviceContext2 {
    /**
     * The interface identifier for ID2D1DeviceContext3
     * @type {Guid}
     */
    static IID := Guid("{235a7496-8351-414c-bcd4-6672ab2d8e00}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1DeviceContext3 interfaces
    */
    struct Vtbl extends ID2D1DeviceContext2.Vtbl {
        CreateSpriteBatch : IntPtr
        DrawSpriteBatch   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1DeviceContext3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new, empty sprite batch. After creating a sprite batch, use ID2D1SpriteBatch::AddSprites to add sprites to it, then use ID2D1DeviceContext3::DrawSpriteBatch to draw it.
     * @returns {ID2D1SpriteBatch} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1spritebatch">ID2D1SpriteBatch</a>**</b>
     * 
     * When this method returns, contains a pointer to a new, empty sprite batch to be populated by the app.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext3-createspritebatch
     */
    CreateSpriteBatch() {
        result := ComCall(106, this, "ptr*", &spriteBatch := 0, "HRESULT")
        return ID2D1SpriteBatch(spriteBatch)
    }

    /**
     * Renders all sprites in the given sprite batch to the device context using the specified drawing options.
     * @param {ID2D1SpriteBatch} spriteBatch Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1spritebatch">ID2D1SpriteBatch</a>*</b>
     * 
     * The sprite batch to draw.
     * @param {Integer} startIndex 
     * @param {Integer} spriteCount 
     * @param {ID2D1Bitmap} _bitmap Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>*</b>
     * 
     * The bitmap from which the sprites are to be sourced. Each sprite’s source rectangle refers to a portion of this bitmap.
     * @param {D2D1_BITMAP_INTERPOLATION_MODE} _interpolationMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_bitmap_interpolation_mode">D2D1_BITMAP_INTERPOLATION_MODE</a></b>
     * 
     * The interpolation mode to use when drawing this sprite batch. This determines how Direct2D interpolates pixels within the drawn sprites if scaling is performed.
     * @param {D2D1_SPRITE_OPTIONS} spriteOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_sprite_options">D2D1_SPRITE_OPTIONS</a></b>
     * 
     * The additional drawing options, if any, to be used for this sprite batch.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext3-drawspritebatch(id2d1spritebatch_id2d1bitmap_d2d1_bitmap_interpolation_mode_d2d1_sprite_options)
     */
    DrawSpriteBatch(spriteBatch, startIndex, spriteCount, _bitmap, _interpolationMode, spriteOptions) {
        ComCall(107, this, "ptr", spriteBatch, "uint", startIndex, "uint", spriteCount, "ptr", _bitmap, D2D1_BITMAP_INTERPOLATION_MODE, _interpolationMode, D2D1_SPRITE_OPTIONS, spriteOptions)
    }

    Query(iid) {
        if (ID2D1DeviceContext3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSpriteBatch := CallbackCreate(GetMethod(implObj, "CreateSpriteBatch"), flags, 2)
        this.vtbl.DrawSpriteBatch := CallbackCreate(GetMethod(implObj, "DrawSpriteBatch"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSpriteBatch)
        CallbackFree(this.vtbl.DrawSpriteBatch)
    }
}
