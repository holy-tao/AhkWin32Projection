#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\INumberRounder.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An interface that gets and sets the option for rounding numbers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberrounderoption
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class INumberRounderOption extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INumberRounderOption
     * @type {Guid}
     */
    static IID => Guid("{3b088433-646f-4efe-8d48-66eb2e49e736}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NumberRounder", "put_NumberRounder"]

    /**
     * Gets or sets the interface used to return rounded numbers.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberrounderoption.numberrounder
     * @type {INumberRounder} 
     */
    NumberRounder {
        get => this.get_NumberRounder()
        set => this.put_NumberRounder(value)
    }

    /**
     * 
     * @returns {INumberRounder} 
     */
    get_NumberRounder() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return INumberRounder(value)
    }

    /**
     * 
     * @param {INumberRounder} value 
     * @returns {HRESULT} 
     */
    put_NumberRounder(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
