#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */

;@region Functions
/**
 * The AMGetErrorText function retrieves the error message for a given return code, using the current language setting. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The errors.h header defines AMGetErrorText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HRESULT} hr <b>HRESULT</b> value.
 * @param {PSTR} pbuffer Pointer to a character buffer that receives the error message.
 * @param {Integer} MaxLen Number of characters in <i>pBuffer</i>.
 * @returns {Integer} Returns the number of characters returned in the buffer, or zero if an error occurred.
 * @see https://learn.microsoft.com/windows/win32/api/errors/nf-errors-amgeterrortexta
 */
export AMGetErrorTextA(hr, pbuffer, MaxLen) {
    pbuffer := pbuffer is String ? StrPtr(pbuffer) : pbuffer

    result := DllCall("QUARTZ.dll\AMGetErrorTextA", "int", hr, "ptr", pbuffer, "uint", MaxLen, UInt32)
    return result
}

/**
 * The AMGetErrorText function retrieves the error message for a given return code, using the current language setting. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The errors.h header defines AMGetErrorText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HRESULT} hr <b>HRESULT</b> value.
 * @param {PWSTR} pbuffer Pointer to a character buffer that receives the error message.
 * @param {Integer} MaxLen Number of characters in <i>pBuffer</i>.
 * @returns {Integer} Returns the number of characters returned in the buffer, or zero if an error occurred.
 * @see https://learn.microsoft.com/windows/win32/api/errors/nf-errors-amgeterrortextw
 */
export AMGetErrorTextW(hr, pbuffer, MaxLen) {
    pbuffer := pbuffer is String ? StrPtr(pbuffer) : pbuffer

    result := DllCall("QUARTZ.dll\AMGetErrorTextW", "int", hr, "ptr", pbuffer, "uint", MaxLen, UInt32)
    return result
}

;@endregion Functions
