#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api//content/wincred/nf-wincred-creduicmdlinepromptforcredentialsa">CredUICmdLinePromptForCredentials</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/wincred/nf-wincred-creduicmdlinepromptforcredentialsw">CredUICmdLinePromptForCredentials</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/wincred/nf-wincred-creduicmdlinepromptforcredentialsa">CredUICmdLinePromptForCredentialsA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/wincred/nf-wincred-creduicmdlinepromptforcredentialsw">CredUICmdLinePromptForCredentialsA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/wincred/nf-wincred-creduicmdlinepromptforcredentialsa">CredUICmdLinePromptForCredentialsW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/wincred/nf-wincred-creduicmdlinepromptforcredentialsw">CredUICmdLinePromptForCredentialsW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/wincred/nf-wincred-creduipromptforcredentialsa">CredUIPromptForCredentials</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/wincred/nf-wincred-creduipromptforcredentialsw">CredUIPromptForCredentials</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/wincred/nf-wincred-creduipromptforcredentialsa">CredUIPromptForCredentialsA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/wincred/nf-wincred-creduipromptforcredentialsw">CredUIPromptForCredentialsA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/wincred/nf-wincred-creduipromptforcredentialsa">CredUIPromptForCredentialsW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/wincred/nf-wincred-creduipromptforcredentialsw">CredUIPromptForCredentialsW</see>.
 * @see 
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class CREDUI_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_ALWAYS_SHOW_UI => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_COMPLETE_USERNAME => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_DO_NOT_PERSIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_EXCLUDE_CERTIFICATES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_EXPECT_CONFIRMATION => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_GENERIC_CREDENTIALS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_INCORRECT_PASSWORD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_KEEP_USERNAME => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_PASSWORD_ONLY_OK => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_PERSIST => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_REQUEST_ADMINISTRATOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_REQUIRE_CERTIFICATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_REQUIRE_SMARTCARD => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_SERVER_CREDENTIAL => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_USERNAME_TARGET_CREDENTIALS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUI_FLAGS_VALIDATE_USERNAME => 1024
}
