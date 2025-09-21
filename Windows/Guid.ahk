#Requires AutoHotkey v2.0

#Include ../Win32Struct.ahk

/**
 * Represents a GUID struct. A GUID is a **G**lobally **U**nique **ID**entifier for some resource. 
 * It's "just" a 128-bit number under the hood. This is a funamental type in Windows and doesn't 
 * appear in the Win32 metadata, so it needs to be hand-written.
 * 
 * When working with AutoHotkey COM interop, it's generally enough to use a string repesentation.
 * However, some of the Win32 APIs (e.g. `Foundation\PROPERTYKEY`) expect a binary representation
 * or pointer to one, which this class exists to provide.
 * 
 * If you are going to be working a lot with GUIDs, you may want to [load](https://www.autohotkey.com/docs/v2/lib/_DllLoad.htm)
 * `ole32.dll` explicitly for performance reasons
 * 
 * @see https://learn.microsoft.com/en-us/windows/win32/api/guiddef/ns-guiddef-guid
 * @author Tao Beloney
 */
class Guid extends Win32Struct {

    static sizeof => 128

    static packingSize => 8

    /**
     * Creates a new GUID structure from a class string
     * @param {String} strGuid String or string pointer in the format `{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}`.
     *          If unset, the Guid is empty (equivalent to Guid.Empty)
     */
    static FromString(strGuid?){
        newGuid := Guid()

        if(IsSet(strGuid)){
            strGuid := strGuid is String? StrPtr(strGuid) : strGuid

            if((rc := DllCall("ole32\CLSIDFromString", "ptr", strGuid, "ptr", newGuid, "hresult")) != 0){
                throw OSError(rc)
            }
        }

        return newGuid
    }

    /**
     * Check whether two Guids are equal or not. Roughly equivalent to `MemoryEquals`, except
     * that this method invokes [`IsEqualGUID`](https://learn.microsoft.com/en-us/windows/win32/api/guiddef/nf-guiddef-isequalguid)
     * @param {Guid} other Guid proxy or pointer to a guid structure in memory 
     */
    Equals(other){
        if(IsObject(other) && !(other is Guid)){
            throw TypeError("Expected a Guid but got a(n) " . other, , other)
        }
        
        return DllCall("ole32\IsEqualGUID", "ptr", this, "ptr", other)
    }

    /**
     * Creates a string representation of the Guid
     * @returns {String} a string representation of the Guid in the format `{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}`
     */
    ToString(){
        ;https://learn.microsoft.com/en-us/windows/win32/api/combaseapi/nf-combaseapi-stringfromguid2
        strBuf := Buffer(78)
        A_LastError := 0
        if(!DllCall("ole32\StringFromGUID2", "ptr", this, "ptr", strBuf, "int", 78)){
            throw OSError()
        }

        return StrGet(strBuf, "UTF-16")
    }
}

test := Guid.FromString("{6B29FC40-CA47-1067-B31D-00DD010662DA}")
MSgBox(String(test))