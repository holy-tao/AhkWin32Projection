#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains information about special processing for each script.
 * @remarks
 * This structure is filled by the <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptgetproperties">ScriptGetProperties</a> function.
  * 
  * Many Uniscribe scripts do not correspond directly to 8-bit character sets. When some of the characters in a script are supported by more than one character set, the <b>fAmbiguousCharSet</b> member is set. The application should do further processing to determine the character set to use when requesting a font suitable for the run. For example, it might determine that the run consists of multiple languages and split the run so that a different font is used for each language.
  * 
  * The application uses the following code during initialization to get a pointer to the <b>SCRIPT_PROPERTIES</b>  array.
  * 
  * 
  * ```cpp
  * const SCRIPT_PROPERTIES **ppScriptProperties; // Array of pointers  
  *                                               // to properties 
  * int iMaxScript;
  * HRESULT hr;
  * 
  * hr = ScriptGetProperties(&ppScriptProperties, &iMaxScript);
  * 
  * ```
  * 
  * 
  * Then the application can inspect the properties of the script of an item as shown in the next example.
  * 
  * 
  * ```cpp
  * hr = ScriptItemize(pwcInChars, cInChars, cMaxItems, psControl, psState, pItems, pcItems);
  * //...
  * if (ppScriptProperties[pItems[iItem].a.eScript]->fNeedsCaretInfo) 
  *     {
  *         // Use ScriptBreak to restrict the caret from entering clusters (for example). 
  *     }
  * 
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_properties
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPT_PROPERTIES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
