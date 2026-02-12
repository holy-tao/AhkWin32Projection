#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreCursor.ahk
#Include .\ICoreCursorFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines a cursor (visual pointer) object.
 * @remarks
 * To create a CoreCursor instance using a pre-defined Windows cursor, use any of the cursor types available in the [CoreCursorType](corecursortype.md) enumeration other than **Custom**. In this case, the **Id** property is ignored.
 * 
 * To use a custom cursor, use the **CoreCursorType.Custom** enumeration option, and specify the **Id** of the custom cursor. You can add a _.res_ resource file that contains the custom cursor to your project and include it in your assembly with the [/win32res](/dotnet/articles/csharp/language-reference/compiler-options/win32res-compiler-option) compiler option. The **Id** is the [Cursor Resource ID](/windows/desktop/menurc/cursor-resource) specified in the _.res_ file.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecursor
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreCursor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreCursor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreCursor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [CoreCursor](corecursor.md) instance of the provided cursor type.
     * @param {Integer} type The type of the new cursor.
     * @param {Integer} id The unique resource ID of the new cursor.
     * @returns {CoreCursor} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecursor.#ctor
     */
    static CreateCursor(type, id) {
        if (!CoreCursor.HasProp("__ICoreCursorFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Core.CoreCursor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreCursorFactory.IID)
            CoreCursor.__ICoreCursorFactory := ICoreCursorFactory(factoryPtr)
        }

        return CoreCursor.__ICoreCursorFactory.CreateCursor(type, id)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the resource ID of the cursor.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecursor.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the type of the cursor.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecursor.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__ICoreCursor")) {
            if ((queryResult := this.QueryInterface(ICoreCursor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreCursor := ICoreCursor(outPtr)
        }

        return this.__ICoreCursor.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__ICoreCursor")) {
            if ((queryResult := this.QueryInterface(ICoreCursor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreCursor := ICoreCursor(outPtr)
        }

        return this.__ICoreCursor.get_Type()
    }

;@endregion Instance Methods
}
