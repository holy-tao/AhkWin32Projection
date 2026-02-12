#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionEntity.ahk
#Include .\IDateTimeActionEntity.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class DateTimeActionEntity extends ActionEntity {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDateTimeActionEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDateTimeActionEntity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {DateTime} 
     */
    DateTime {
        get => this.get_DateTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DateTime() {
        if (!this.HasProp("__IDateTimeActionEntity")) {
            if ((queryResult := this.QueryInterface(IDateTimeActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDateTimeActionEntity := IDateTimeActionEntity(outPtr)
        }

        return this.__IDateTimeActionEntity.get_DateTime()
    }

;@endregion Instance Methods
}
