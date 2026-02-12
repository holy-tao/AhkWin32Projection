#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An interface that returns rounded results for provided numbers of several data types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberrounder
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class INumberRounder extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INumberRounder
     * @type {Guid}
     */
    static IID => Guid("{5473c375-38ed-4631-b80c-ef34fc48b7f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RoundInt32", "RoundUInt32", "RoundInt64", "RoundUInt64", "RoundSingle", "RoundDouble"]

    /**
     * Rounds an **Int32** number.
     * @param {Integer} value The **Int32** value to be rounded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberrounder.roundint32
     */
    RoundInt32(value) {
        result := ComCall(6, this, "int", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Rounds a **UInt32** number.
     * @param {Integer} value The **UInt32** value to be rounded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberrounder.rounduint32
     */
    RoundUInt32(value) {
        result := ComCall(7, this, "uint", value, "uint*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Rounds an **Int64** number.
     * @param {Integer} value The **Int64** value to be rounded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberrounder.roundint64
     */
    RoundInt64(value) {
        result := ComCall(8, this, "int64", value, "int64*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Rounds a **UInt64** number.
     * @param {Integer} value The **UInt64** value to be rounded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberrounder.rounduint64
     */
    RoundUInt64(value) {
        result := ComCall(9, this, "uint", value, "uint*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Rounds a **Single** number.
     * @remarks
     * > [!NOTE]
     * > This method is precise only within the limits of the **Single** data type: approximately 7 digits.
     * @param {Float} value The **Single** value to be rounded.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberrounder.roundsingle
     */
    RoundSingle(value) {
        result := ComCall(10, this, "float", value, "float*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Rounds a **Double** number.
     * @remarks
     * > [!NOTE]
     * > This method is precise only within the limits of the [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) data type: approximately 15 digits.
     * @param {Float} value The **Double** value to be rounded.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberrounder.rounddouble
     */
    RoundDouble(value) {
        result := ComCall(11, this, "double", value, "double*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
