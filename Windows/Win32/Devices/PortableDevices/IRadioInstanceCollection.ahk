#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRadioInstance.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IRadioInstanceCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadioInstanceCollection
     * @type {Guid}
     */
    static IID => Guid("{e5791fae-5665-4e0c-95be-5fde31644185}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt"]

    /**
     * Retrieves the number of tagged elements in a given color profile.
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getcountcolorprofileelements
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pcInstance := 0, "HRESULT")
        return pcInstance
    }

    /**
     * Retrieves a copy of the character string associated with the specified local atom. (ANSI)
     * @remarks
     * The string returned for an integer atom (an atom whose value is in the range 0x0001 to 0xBFFF) is a null-terminated string in which the first character is a pound sign (#) and the remaining characters represent the unsigned integer atom value. 
     * 
     * <h3><a id="Security_Considerations"></a><a id="security_considerations"></a><a id="SECURITY_CONSIDERATIONS"></a>Security Considerations</h3>
     * Using this function incorrectly might compromise the security of your program. Incorrect use of this function includes not correctly specifying the size of the <i>lpBuffer</i> parameter. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetAtomName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} uIndex 
     * @returns {IRadioInstance} 
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getatomnamea
     */
    GetAt(uIndex) {
        result := ComCall(4, this, "uint", uIndex, "ptr*", &ppRadioInstance := 0, "HRESULT")
        return IRadioInstance(ppRadioInstance)
    }
}
