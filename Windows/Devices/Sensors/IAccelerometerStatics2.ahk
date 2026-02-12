#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Accelerometer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IAccelerometerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccelerometerStatics2
     * @type {Guid}
     */
    static IID => Guid("{c4c4842f-d86b-4685-b2d7-3396f798d57b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefaultWithAccelerometerReadingType"]

    /**
     * Retrieves the default configuration for the specified communications device. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The winbase.h header defines GetDefaultCommConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} readingType 
     * @returns {Accelerometer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-getdefaultcommconfigw
     */
    GetDefaultWithAccelerometerReadingType(readingType) {
        result := ComCall(6, this, "int", readingType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Accelerometer(result_)
    }
}
