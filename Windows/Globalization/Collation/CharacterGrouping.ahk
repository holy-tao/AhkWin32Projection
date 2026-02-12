#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICharacterGrouping.ahk
#Include ..\..\..\Guid.ahk

/**
 * A container for character group information. Characters are grouped in an index that enables an application to determine where the grouping boundaries are.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.collation.charactergrouping
 * @namespace Windows.Globalization.Collation
 * @version WindowsRuntime 1.4
 */
class CharacterGrouping extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICharacterGrouping

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICharacterGrouping.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the first item that appears in the grouping under this index.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.collation.charactergrouping.first
     * @type {HSTRING} 
     */
    First {
        get => this.get_First()
    }

    /**
     * Gets the label that is associated with this index.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.collation.charactergrouping.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_First() {
        if (!this.HasProp("__ICharacterGrouping")) {
            if ((queryResult := this.QueryInterface(ICharacterGrouping.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICharacterGrouping := ICharacterGrouping(outPtr)
        }

        return this.__ICharacterGrouping.get_First()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        if (!this.HasProp("__ICharacterGrouping")) {
            if ((queryResult := this.QueryInterface(ICharacterGrouping.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICharacterGrouping := ICharacterGrouping(outPtr)
        }

        return this.__ICharacterGrouping.get_Label()
    }

;@endregion Instance Methods
}
