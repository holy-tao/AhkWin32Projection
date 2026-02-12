#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBitmapBuffer.ahk
#Include ..\..\Foundation\IMemoryBuffer.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the pixel data buffer of a bitmap.
 * @remarks
 * Get an instance of this class by calling [SoftwareBitmap.LockBuffer](softwarebitmap_lockbuffer_109667063.md). Because the **BitmapBuffer** represents an exclusive lock on the associated bitmap, apps should not keep the reference to it indefinitely.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapbuffer
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapBuffer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBitmapBuffer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBitmapBuffer.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Gets the number of bit planes in the bitmap buffer.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapbuffer.getplanecount
     */
    GetPlaneCount() {
        if (!this.HasProp("__IBitmapBuffer")) {
            if ((queryResult := this.QueryInterface(IBitmapBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapBuffer := IBitmapBuffer(outPtr)
        }

        return this.__IBitmapBuffer.GetPlaneCount()
    }

    /**
     * Gets a BitmapPlaneDescription object that describes the size, offset, and stride of the bitmap data in the bit plane with the specified index.
     * @param {Integer} index The index of the bit plane for which the description is retrieved.
     * @returns {BitmapPlaneDescription} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapbuffer.getplanedescription
     */
    GetPlaneDescription(index) {
        if (!this.HasProp("__IBitmapBuffer")) {
            if ((queryResult := this.QueryInterface(IBitmapBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapBuffer := IBitmapBuffer(outPtr)
        }

        return this.__IBitmapBuffer.GetPlaneDescription(index)
    }

    /**
     * Creates a reference to the underlying memory buffer.
     * @returns {IMemoryBufferReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapbuffer.createreference
     */
    CreateReference() {
        if (!this.HasProp("__IMemoryBuffer")) {
            if ((queryResult := this.QueryInterface(IMemoryBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMemoryBuffer := IMemoryBuffer(outPtr)
        }

        return this.__IMemoryBuffer.CreateReference()
    }

    /**
     * Disposes of the object and associated resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapbuffer.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
