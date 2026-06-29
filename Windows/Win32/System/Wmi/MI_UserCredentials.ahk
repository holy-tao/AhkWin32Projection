#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_UsernamePasswordCreds.ahk" { MI_UsernamePasswordCreds }

/**
 * A user's credentials. It includes an authentication type and either a username and password or a certificate thumbprint.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_usercredentials
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_UserCredentials {
    #StructPack 8


    struct _credentials {
        usernamePassword : MI_UsernamePasswordCreds

        static __New() {
            DefineProp(this.Prototype, 'certificateThumbprint', { type: IntPtr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    authenticationType : IntPtr

    credentials : MI_UserCredentials._credentials

}
